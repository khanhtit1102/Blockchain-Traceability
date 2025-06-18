const contractAddress = "0xe1ed23275AA952F8aaf01a03a90bF31db42AD2f5";
const abi = [{ "anonymous": false, "inputs": [{ "indexed": false, "internalType": "string", "name": "productId", "type": "string" }, { "indexed": false, "internalType": "string", "name": "name", "type": "string" }, { "indexed": false, "internalType": "address", "name": "owner", "type": "address" }], "name": "ProductRegistered", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "string", "name": "productId", "type": "string" }, { "indexed": false, "internalType": "enum AgriTrace.StageType", "name": "stageType", "type": "uint8" }, { "indexed": false, "internalType": "string", "name": "data", "type": "string" }], "name": "StageAdded", "type": "event" }, { "inputs": [{ "internalType": "string", "name": "productId", "type": "string" }, { "internalType": "enum AgriTrace.StageType", "name": "stageType", "type": "uint8" }, { "internalType": "string", "name": "data", "type": "string" }], "name": "addStage", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "string", "name": "productId", "type": "string" }], "name": "getProduct", "outputs": [{ "internalType": "string", "name": "name", "type": "string" }, { "internalType": "address", "name": "owner", "type": "address" }, { "internalType": "uint256", "name": "stageCount", "type": "uint256" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "string", "name": "productId", "type": "string" }], "name": "getProductHistory", "outputs": [{ "components": [{ "internalType": "enum AgriTrace.StageType", "name": "stageType", "type": "uint8" }, { "internalType": "string", "name": "data", "type": "string" }, { "internalType": "uint256", "name": "timestamp", "type": "uint256" }, { "internalType": "uint256", "name": "blockNumber", "type": "uint256" }, { "internalType": "bytes32", "name": "previousBlockHash", "type": "bytes32" }], "internalType": "struct AgriTrace.Stage[]", "name": "", "type": "tuple[]" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "string", "name": "productId", "type": "string" }, { "internalType": "string", "name": "name", "type": "string" }], "name": "registerProduct", "outputs": [], "stateMutability": "nonpayable", "type": "function" }];

let provider;
let signer;
let contract;

async function connectWallet() {
    if (window.ethereum) {
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        provider = new ethers.BrowserProvider(window.ethereum);
        signer = await provider.getSigner();
        contract = new ethers.Contract(contractAddress, abi, signer);
        alert("Kết nối thành công!");
    } else {
        alert("Bạn cần cài MetaMask!");
    }
}

async function getContract() {
    if (!window.ethereum) {
        alert("Vui lòng cài MetaMask!");
        return;
    }

    await window.ethereum.request({ method: 'eth_requestAccounts' });
    const provider = new ethers.BrowserProvider(window.ethereum);
    const signer = await provider.getSigner();

    return new ethers.Contract(contractAddress, abi, signer);
}

async function getContractWithoutWallet() {
    const provider = new ethers.JsonRpcProvider('https://eth-sepolia.g.alchemy.com/v2/fTT_YWkE5NbBYWW6Tw-sH6CHd8A5eEYI');
    const contract = new ethers.Contract(contractAddress, abi, provider);
    return contract;
}

async function handleRegister() {
    const productId = $('input[name="trace_code"]').val();
    const name = $('input[name="name"]').val();

    try {
        console.log("👉 Bắt đầu đăng ký sản phẩm:", productId, name);
        const contract = await getContract();
        console.log("📌 Đã lấy được contract:", contract);

        try {
            const product = await contract.getProduct(productId);
            console.log("ℹ️ Thông tin sản phẩm:", product);

            if (product.owner !== '0x0000000000000000000000000000000000000000') {
                alert("⚠️ Mã sản phẩm đã tồn tại. Hãy thử mã khác!");
                return;
            }
            console.log("✅ Sản phẩm chưa tồn tại, tiếp tục đăng ký...");
        } catch (e) {
            console.warn("❌ Không tìm thấy sản phẩm cũ:", e.message);
        }

        try {
            await contract.registerProduct.estimateGas(productId, name);
            console.log("✅ Có thể gửi giao dịch.");
            $('#loading-text-status').text('Đang xử lý giao dịch...');
            $('body').addClass('is-loading');
        } catch (err) {
            console.error("❌ Không thể gửi giao dịch:", err);
            alert("❌ Không thể đăng ký sản phẩm: " + err.message);
            $('body').removeClass('is-loading');
            return;
        }

        const tx = await contract.registerProduct(productId, name);
        console.log("📤 Gửi giao dịch:", tx);
        $('#loading-text-status').text('Giao dịch đã được gửi, đang chờ xác nhận...');
        const receipt = await tx.wait();
        console.log("✅ Giao dịch hoàn tất:", receipt);
        $('#loading-text-status').text('Giao dịch hoàn tất!');
        $('form.form-edit-add').submit();
    } catch (err) {
        console.error("❌ Lỗi tổng:", err);
        if (err.code === 4001 || err.code === "ACTION_REJECTED") {
            alert("⛔ Bạn đã từ chối giao dịch.");
            $('body').removeClass('is-loading');
        } else {
            alert("❌ Lỗi: " + err.message);
            $('body').removeClass('is-loading');
        }
    }
}

async function handleAddStage() {

    const visibleClasses = ['.ql-va-san-xuat', '.che-bien', '.luu-thong', '.tieu-thu'];
    const inputs = visibleClasses
        .filter(selector => !$(selector).hasClass('d-none'))
        .flatMap(selector => $(`${selector} input, ${selector} textarea`));
    const productId = $('input#trace_code').val();
    const stageType = $('select#stageSelect').val();
    const data = {};

    if (inputs.length !== 0) {
        inputs[0].each(function () {
            const name = $(this).attr('name');
            if (name) {
                data[name] = $(this).val();
            }
        });
    }

    const jsonData = JSON.stringify(data);
    $("input[name='stage_data']").val(jsonData);

    // Add stage by calling the contract
    try {
        console.log("👉 Bắt đầu thêm giai đoạn:", productId, stageType, jsonData);
        const contract = await getContract();
        console.log("📌 Đã lấy được contract:", contract);

        try {
            await contract.addStage.estimateGas(productId, stageType, jsonData);
            console.log("✅ Có thể gửi giao dịch.");
            $('#loading-text-status').text('Đang xử lý giao dịch...');
            $('body').addClass('is-loading');
        } catch (err) {
            console.error("❌ Không thể gửi giao dịch:", err);
            alert("❌ Không thể thêm giai đoạn: " + err.message);
            return;
        }

        const tx = await contract.addStage(productId, stageType, jsonData);
        console.log("📤 Gửi giao dịch:", tx);
        $('#loading-text-status').text('Giao dịch đã được gửi, đang chờ xác nhận...');
        const receipt = await tx.wait();
        console.log("✅ Giao dịch hoàn tất:", receipt);
        $('#loading-text-status').text('Giao dịch hoàn tất!');

        const txHash = receipt.hash;
        console.log("📜 Hash giao dịch:", txHash);

        const $hiddenInput = $('<input>', {
            type: 'hidden',
            name: 'tx_hash',
            value: txHash
        });
        $('#addStageForm').append($hiddenInput);

        $('.remove-attribute-name input, .remove-attribute-name textarea').removeAttr('name');
        $("input[name='stage_data']").val(jsonData);

        $('#addStageForm').submit();

    } catch (err) {
        console.error("❌ Lỗi tổng khi thêm giai đoạn:", err);
        if (err.code === 4001 || err.code === "ACTION_REJECTED") {
            alert("⛔ Bạn đã từ chối giao dịch.");
        } else {
            alert("❌ Lỗi: " + err.message);
        }
        $('body').removeClass('is-loading');
    }
}

async function fetchStageNames() {
    try {
        const response = await fetch('http://localhost/Agridential/public/api/stages');
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error("Lỗi khi gọi API stages:", error);
        alert("Không thể tải thông tin tên giai đoạn!");
        return {};
    }
}

async function loadHistory(productId) {
    const contract = await getContractWithoutWallet();

    try {
        const rawHistory = await contract.getProductHistory(productId);
        console.log("📜 Lịch sử sản phẩm:", rawHistory);
        const parsed = rawHistory.map(item => {
            return {
                stageType: Number(item[0]),
                data: JSON.parse(item[1]),
                timestamp: Number(item[2]),
                blockNumber: item[3] ? Number(item[3]) : null,
                prevHash: item[4] || null
            };
        });

        var images = [];
        var tx_hash = [];

        try {
            const response = await $.get(historyRoute);
            if (response && Array.isArray(response.images)) {
                images = response.images;
                tx_hash = response.tx_hash;
            } else {
                console.warn("Không tìm thấy ảnh cho lịch sử sản phẩm.");
            }
        } catch (error) {
            console.error("Lỗi khi gọi API product-histories:", error);
        }
        displayHistory(parsed, images, tx_hash);
    } catch (err) {
        console.error('Lỗi khi tải lịch sử:', err);
        // alert('Không thể lấy dữ liệu lịch sử!');
    }
}
async function displayHistory(historyArray, apiImages, apiTXHash) {
    const StageName = [
        "",
        "Quản lý vườn chè và sản xuất chè",
        "Chế biến chè",
        "Lưu thông chè",
        "Tiêu thụ chè"
    ];
    const StageIconClass = [
        "",
        "fa-solid fa-seedling",
        "fa-solid fa-utensils",
        "fa-solid fa-truck",
        "fa-solid fa-shopping-cart"
    ];
    var container = document.getElementById('uk-timeline');
    if (container) {
        container.innerHTML = ''; // reset

        historyArray.forEach((entry, idx) => {

            const dateStr = new Date(entry.timestamp * 1000).toLocaleString();
            let content = '';
            for (const [key, value] of Object.entries(entry.data)) {
                if (value) {
                    content += `<p><strong>${key}:</strong> ${value}</p>`;
                }
            }
            let imageHTML = '';
            const images = apiImages[idx] || [];
            if (images.length > 0) {
                content += `<div class="timeline-images uk-margin-top">`;
                images.forEach((image, imgIdx) => {
                    content += `<a href="${assetUrl + image}" data-lightbox="${StageName[entry.stageType] || 'Unknown Stage'}" data-title="${StageName[entry.stageType] || 'Unknown Stage'}"><img src="${assetUrl + image}" alt="${StageName[entry.stageType] || 'Unknown Stage'}"></a>`;
                });
                content += `</div>`;
            }

            const block = `
            <div class="uk-timeline-item">
                <div class="uk-timeline-icon">
                    <span class="uk-badge"><i class="glyphicon glyphicon-ok"></i></span>
                </div>
                <div class="uk-timeline-content">
                    <div class="uk-card uk-card-default uk-margin-medium-bottom uk-overflow-auto">
                        <div class="uk-card-header">
                            <div class="uk-grid-small uk-flex-middle" uk-grid>
                                <h3 class="uk-card-title">${StageName[entry.stageType] || 'Unknown Stage'}</h3>
                                <span class="uk-label uk-label-success uk-margin-auto-left">${dateStr}</span>
                            </div>
                        </div>
                        <div class="uk-card-body">
                            ${content || '<p>Không có dữ liệu.</p>'}
                            ${imageHTML || ''}
                        </div>
                    </div>
                </div>
            </div>`;

            container.innerHTML += block;
        });
    }
    else {
        container = document.getElementById('timeline-front');

        if (container) {
            container.innerHTML = ''; // reset

            historyArray.forEach((entry, idx) => {

                const dateStr = new Date(entry.timestamp * 1000).toLocaleString();
                let content = '';
                for (const [key, value] of Object.entries(entry.data)) {
                    if (value) {
                        content += `<p><strong>${key}:</strong> ${value}</p>`;
                    }
                }
                let imageHTML = '';
                const images = apiImages[idx] || [];

                if (images.length > 0) {
                    imageHTML = `<div class="timeline-images">`;
                    images.forEach((image, imgIdx) => {
                        imageHTML += `<a href="${assetUrl + image}" data-lightbox="${StageName[entry.stageType] || 'Unknown Stage'}" data-title="${StageName[entry.stageType] || 'Unknown Stage'}"><img src="${assetUrl + image}" alt="${StageName[entry.stageType] || 'Unknown Stage'}"></a>`;
                    });
                    imageHTML += `</div>`;
                }

                const block = `
                <li class="timeline-item" data-aos="fade-right">
                    <div class="timeline-icon"><i class="${StageIconClass[entry.stageType] || 'fa-solid fa-question'}"></i></div>
                    <div class="timeline-content">
                        <h5>${StageName[entry.stageType] || 'Unknown Stage'}</h5>
                        <p class="timeline-time"><i class="fa-regular fa-calendar me-1"></i>${dateStr}
                        </p>
                        ${content || '<p>Không có dữ liệu.</p>'}
                        ${imageHTML || ''}
                        <a href="#" class="blockchain-hash" data-bs-toggle="modal"
                            data-bs-target="#blockchainModal" data-block-number="${entry.blockNumber || '0'}"
                            data-timestamp="${dateStr}"
                            data-tx-hash="${apiTXHash[idx] || '0x000...000'}">
                            <i class="fa-solid fa-cube"></i><strong>Hash:</strong>&nbsp;<span>${apiTXHash[idx] || '0x000...000'}</span>
                        </a>
                    </div>
                </li>`;

                container.innerHTML += block;
            });
        }
    }
}

$(document).ready(() => {
    $('.btnRegister').on('click', handleRegister);
    $('.btnAddStage').on('click', handleAddStage);


});
const traceCodeInput = $('input#trace_code').val();
if (traceCodeInput.length) {
    if (traceCodeInput) {
        loadHistory(traceCodeInput);
    }
}

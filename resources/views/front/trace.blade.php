@extends('front.layouts.main')

@section('css')
    <style>
        .product-header {
            background: white;
            padding: 2rem;
            margin-top: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, .07);
        }

        .product-main-image {
            width: 100%;
            height: auto;
            max-height: 350px;
            object-fit: cover;
            border-radius: 10px;
        }

        .product-gallery img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            border: 2px solid transparent;
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .product-gallery img:hover,
        .product-gallery img.active {
            transform: scale(1.1);
            box-shadow: 0 0 10px rgba(0, 121, 107, 0.5);
            border-color: var(--primary-color);
        }

        .product-info h1 {
            font-weight: 700;
            color: var(--dark-text);
        }

        .trace-code {
            background-color: var(--light-primary-color);
            color: var(--primary-color);
            padding: 5px 15px;
            border-radius: 15px;
            font-weight: 500;
            display: inline-block;
        }

        .tabs-container {
            background: white;
            margin-top: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, .07);
            padding: 1.5rem;
        }

        .nav-tabs .nav-link {
            border: none;
            border-bottom: 3px solid transparent;
            font-weight: 500;
        }

        .nav-tabs.nav-fill .nav-link {
            text-align: center;
        }

        /* Căn giữa text cho tab nav-fill */
        .nav-tabs .nav-link.active {
            border-color: var(--primary-color);
            color: var(--primary-color);
        }

        /* --- TIMELINE CSS --- */
        .timeline {
            position: relative;
            padding: 2rem 0;
            list-style: none;
        }

        .timeline::before {
            content: '';
            position: absolute;
            top: 0;
            left: 20px;
            height: 100%;
            width: 4px;
            background: #e0e0e0;
            border-radius: 2px;
        }

        .timeline-item {
            position: relative;
            margin-bottom: 40px;
        }

        .timeline-item:last-child {
            margin-bottom: 0;
        }

        .timeline-icon {
            position: absolute;
            left: 0;
            top: 0;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            z-index: 1;
            border: 3px solid #f8f9fa;
        }

        .timeline-content {
            margin-left: 60px;
            background: #f1f8e9;
            padding: 20px;
            border-radius: 8px;
            position: relative;
            border: 1px solid #dcedc8;
        }

        .timeline-content::before {
            content: '';
            position: absolute;
            top: 15px;
            left: -10px;
            height: 0;
            width: 0;
            border-top: 10px solid transparent;
            border-bottom: 10px solid transparent;
            border-right: 10px solid #f1f8e9;
        }

        .timeline-content h5 {
            font-weight: 700;
            color: #33691e;
        }

        .timeline-time {
            font-size: 0.9rem;
            color: var(--light-text);
            margin-bottom: 10px;
        }

        .timeline-images {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .timeline-images img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .timeline-images img:hover {
            transform: scale(1.05);
        }

        /* --- BLOCKCHAIN HASH & MODAL STYLES --- */
        .blockchain-hash {
            font-size: 0.8rem;
            font-family: 'Courier New', Courier, monospace;
            color: #004d40;
            margin-top: 15px;
            background-color: #e8f5e9;
            padding: 5px 10px;
            border-radius: 4px;
            display: inline-flex;
            align-items: center;
            text-decoration: none;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .blockchain-hash:hover {
            background-color: #dcedc8;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, .1);
        }

        .blockchain-hash i {
            margin-right: 8px;
        }

        .modal-header {
            background-color: var(--primary-color);
            color: white;
        }

        .modal-header .btn-close {
            filter: invert(1) grayscale(100%) brightness(200%);
        }

        .block-info dt {
            font-weight: 700;
            color: var(--dark-text);
        }

        .block-info dd {
            font-family: 'Courier New', Courier, monospace;
            color: var(--light-text);
            word-break: break-all;
            background-color: #f5f5f5;
            padding: 5px;
            border-radius: 4px;
        }

        /* --- HIỆU ỨNG TICK XÁC MINH --- */
        .verification-wrapper {
            padding: 40px 20px;
            text-align: center;
        }

        .checkmark__circle {
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            stroke-width: 2;
            stroke-miterlimit: 10;
            stroke: var(--success-color);
            fill: none;
            animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }

        .checkmark {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            display: block;
            stroke-width: 2;
            stroke: #fff;
            stroke-miterlimit: 10;
            margin: 10% auto;
            box-shadow: inset 0px 0px 0px var(--success-color);
            animation: fill .4s ease-in-out .4s forwards, scale .3s ease-in-out .9s both;
        }

        .checkmark__check {
            transform-origin: 50% 50%;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards;
        }

        @keyframes stroke {
            100% {
                stroke-dashoffset: 0;
            }
        }

        @keyframes scale {

            0%,
            100% {
                transform: none;
            }

            50% {
                transform: scale3d(1.1, 1.1, 1);
            }
        }

        @keyframes fill {
            100% {
                box-shadow: inset 0px 0px 0px 30px var(--success-color);
            }
        }

        /* Tùy chỉnh cho Lightbox */
        .lightbox .lb-data .lb-caption {
            font-family: 'Be Vietnam Pro', sans-serif;
        }
    </style>
@endsection

@section('content')
    <!-- ========= PRODUCT HEADER ========= -->
    <section class="product-header" data-aos="fade-up">
        <div class="row align-items-center">
            <div class="col-lg-5 text-center">
                <a href="{{ Voyager::image($product->avatar) }}" data-lightbox="product-main"
                    data-title="{{ $product->name ?? '' }}"><img id="mainProductImage"
                        src="{{ Voyager::image($product->avatar) }}" alt="Chè Thái Nguyên" class="product-main-image"></a>
                <div class="d-flex justify-content-center gap-2 product-gallery mt-3">
                    @if ($product->avatar)
                        <img src="{{ Voyager::image($product->avatar) }}" alt="{{ $product->name ?? '' }}" class="active"
                            onclick="changeImage(this)">
                    @endif
                    @if ($product->images)
                        @php
                            $images = json_decode($product->images, true);
                        @endphp
                        @foreach ($images as $image)
                            <img src="{{ Voyager::image($image) }}" alt="{{ $product->name ?? '' }}"
                                onclick="changeImage(this)">
                        @endforeach
                    @endif
                </div>
            </div>
            <div class="col-lg-7 product-info">
                <h1 class="mt-4 mt-lg-0">{{ $product->name ?? '' }}</h1>
                <p class="lead text-muted">{!! $product->short_description !!}</p>
                <div><span class="trace-code">Trace Code: {{ $product->trace_code ?? '' }}</span></div>
                <input type="hidden" id="trace_code" value="{{ $product->trace_code ?? '' }}">
                <p class="mt-3"><i class="fa-regular fa-calendar-check me-2"></i><strong>Ngày tạo:</strong>
                    {{ $product->created_at ?? '' }}</p>
                <p>{!! $product->excerpt !!}</p>
            </div>
        </div>
    </section>
    <!-- ========= TABS CONTAINER ========= -->
    <section class="tabs-container" data-aos="fade-up" data-aos-delay="100">
        <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
            <li class="nav-item" role="presentation"><button class="nav-link" id="product-tab" data-bs-toggle="tab"
                    data-bs-target="#product-tab-pane" type="button" role="tab">Sản
                    phẩm</button></li>
            <li class="nav-item" role="presentation"><button class="nav-link" id="company-tab" data-bs-toggle="tab"
                    data-bs-target="#company-tab-pane" type="button" role="tab">Nhà
                    sản xuất</button></li>
            <li class="nav-item" role="presentation"><button class="nav-link" id="certification-tab" data-bs-toggle="tab"
                    data-bs-target="#certification-tab-pane" type="button" role="tab">Chứng
                    nhận</button></li>
            <li class="nav-item" role="presentation"><button class="nav-link active" id="traceability-tab"
                    data-bs-toggle="tab" data-bs-target="#traceability-tab-pane" type="button" role="tab">Lịch sử
                    sản phẩm</button></li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade p-3" id="product-tab-pane" role="tabpanel">
                {!! $product->description !!}
            </div>
            <div class="tab-pane fade p-3" id="company-tab-pane" role="tabpanel">
                <div class="row align-items-center">
                    <div class="col-md-4 text-center">
                        <img src="{{ Voyager::image($product->createdBy ? $product->createdBy->avatar : '') }}"
                            class="img-fluid rounded-circle mb-3" alt="Logo Công ty">
                    </div>
                    <div class="col-md-8">
                        <h4 class="mb-3" style="color: var(--primary-color);">
                            {{ $product->createdBy ? $product->createdBy->company_name : '' }}</h4>
                        <div class="text-muted">
                            {!! $product->createdBy ? $product->createdBy->description : '' !!}
                        </div>
                        <hr>
                        <ul class="list-unstyled">
                            <li class="mb-2"><i class="fa-solid fa-globe me-2 text-secondary"></i>
                                <a href="{{ $product->createdBy ? $product->createdBy->website : '' }}"
                                    class="text-decoration-none"
                                    style="color: var(--primary-color);">{{ $product->createdBy ? $product->createdBy->website : '' }}</a>
                            </li>
                            <li class="mb-2"><i class="fa-solid fa-phone me-2 text-secondary"> </i>
                                <a href="{{ $product->createdBy ? $product->createdBy->phone : '' }}"
                                    class="text-decoration-none"
                                    style="color: var(--primary-color);">{{ $product->createdBy ? $product->createdBy->phone : '' }}</a>
                            </li>
                            <li class="mb-2"><i class="fa-solid fa-envelope me-2 text-secondary"></i>
                                <a href="mailto:{{ $product->createdBy ? $product->createdBy->email : '' }}"
                                    class="text-decoration-none"
                                    style="color: var(--primary-color);">{{ $product->createdBy ? $product->createdBy->email : '' }}</a>
                            </li>
                            <li class="mb-2"><i class="fa-solid fa-location-dot me-2 text-secondary"></i>
                                <span
                                    style="color: var(--primary-color);">{{ $product->createdBy ? $product->createdBy->address : '' }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade p-3" id="certification-tab-pane" role="tabpanel">
                {!! $product->certification_content !!}
            </div>
            <div class="tab-pane fade show active" id="traceability-tab-pane" role="tabpanel">
                <ul class="timeline" id="timeline-front">

                </ul>
            </div>
        </div>
    </section>
    <!-- MODAL XÁC MINH GIAO DỊCH -->
    <div class="modal fade" id="blockchainModal" tabindex="-1" aria-labelledby="blockchainModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="blockchainModalLabel">Xác minh Giao dịch Blockchain</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Hiệu ứng xác minh -->
                    <div id="verificationAnimation" class="verification-wrapper">
                        <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
                            <circle class="checkmark__circle" cx="26" cy="26" r="25" fill="none" />
                            <path class="checkmark__check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                        </svg>
                        <p class="mt-2 text-muted">Đang xác minh trên sổ cái...</p>
                    </div>
                    <!-- Thông tin Block -->
                    <div id="blockInfo" class="d-none">
                        <h5 class="text-success"><i class="fa-solid fa-circle-check"></i> Giao dịch đã được xác thực!
                        </h5>
                        <dl class="row mt-3 block-info">
                            <dt class="col-sm-4">Block Number</dt>
                            <dd class="col-sm-8" id="modal-block-number"></dd>

                            <dt class="col-sm-4">Timestamp</dt>
                            <dd class="col-sm-8" id="modal-timestamp"></dd>

                            <dt class="col-sm-4">Transaction Hash</dt>
                            <dd class="col-sm-8" id="modal-tx-hash"></dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('js')
    <script>
        $(document).ready(function() {
            // Khởi tạo các thư viện
            AOS.init({
                duration: 800,
                once: false
            });
            lightbox.option({
                'resizeDuration': 200,
                'wrapAround': true,
                'albumLabel': "Ảnh %1 / %2"
            });

            // Hàm thay đổi ảnh chính
            function changeImage(element) {
                const mainImage = $('#mainProductImage');
                const mainImageLink = mainImage.parent();

                // Lấy src của ảnh được click (ảnh thumbnail)
                const newImageSrc = $(element).attr('src');

                // Tạo URL mới cho ảnh chính và lightbox có độ phân giải cao hơn
                const highResSrc = newImageSrc.replace('/100/100', '/800/600');

                mainImage.attr('src', highResSrc);
                mainImageLink.attr('href', highResSrc);

                $('.product-gallery img').removeClass('active');
                $(element).addClass('active');
            }

            // Xử lý sự kiện cho Modal Blockchain
            const blockchainModal = $('#blockchainModal');
            blockchainModal.on('show.bs.modal', function(event) {
                const button = $(event.relatedTarget);
                const blockNumber = button.data('block-number');
                const timestamp = button.data('timestamp');
                const txHash = button.data('tx-hash');
                const verificationAnimation = blockchainModal.find('#verificationAnimation');
                const blockInfo = blockchainModal.find('#blockInfo');
                verificationAnimation.removeClass('d-none');
                blockInfo.addClass('d-none');

                setTimeout(() => {
                    blockchainModal.find('#modal-block-number').html(
                        `<a href="https://sepolia.etherscan.io/block/${blockNumber}" target="_new">${blockNumber}</a>`
                    );
                    blockchainModal.find('#modal-timestamp').text(timestamp);
                    blockchainModal.find('#modal-tx-hash').html(
                        `<a href="https://sepolia.etherscan.io/tx/${txHash}" target="_new">${txHash}</a>`
                    );
                    verificationAnimation.addClass('d-none');
                    blockInfo.removeClass('d-none');
                }, 2500);
            });
        });
    </script>
    <script>
        const historyRoute = "{{ route('api.product-histories', ['trace_code' => $product->trace_code ?? '']) }}";
        const assetUrl = "{{ asset('') }}storage/";
    </script>
    <script type="module" src="{{ asset('resources/js/blockchain.js') }}?time={{ time() }}"></script>
@endsection

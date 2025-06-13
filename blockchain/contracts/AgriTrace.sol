// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriTrace {
    enum StageType {
        Planting,
        Harvesting,
        Packaging,
        Shipping,
        Distributing
    }

    struct Stage {
        StageType stageType; // Loại công đoạn
        string data; // Thông tin chi tiết (JSON/text mô tả)
        uint timestamp; // Thời gian thêm
        uint256 blockNumber; // Lưu block number
        bytes32 previousBlockHash; // Lưu hash của block trước đó
    }

    struct Product {
        string name; // Tên sản phẩm
        address owner; // Người đăng ký sản phẩm
        Stage[] history; // Danh sách công đoạn
    }

    // productId => Product
    mapping(string => Product) private products;

    /// ========== EVENTS ==========
    event ProductRegistered(string productId, string name, address owner);
    event StageAdded(string productId, StageType stageType, string data);

    /// ========== REGISTER ==========
    function registerProduct(
        string memory productId,
        string memory name
    ) external {
        require(
            products[productId].owner == address(0),
            "Product already registered"
        );

        Product storage newProduct = products[productId];
        newProduct.name = name;
        newProduct.owner = msg.sender;

        emit ProductRegistered(productId, name, msg.sender);
    }

    /// ========== UPDATE STAGE ==========
    function addStage(
        string memory productId,
        StageType stageType,
        string memory data
    ) external {
        require(products[productId].owner != address(0), "Product not found");
        require(
            products[productId].owner == msg.sender,
            "Only owner can add stage"
        );

        products[productId].history.push(
            Stage({
                stageType: stageType,
                data: data,
                timestamp: block.timestamp,
                blockNumber: block.number,
                previousBlockHash: blockhash(block.number - 1)
            })
        );

        emit StageAdded(productId, stageType, data);
    }

    /// ========== GET HISTORY ==========
    function getProductHistory(
        string memory productId
    ) external view returns (Stage[] memory) {
        return products[productId].history;
    }

    /// ========== GET PRODUCT INFO ==========
    function getProduct(
        string memory productId
    )
        external
        view
        returns (string memory name, address owner, uint stageCount)
    {
        Product storage p = products[productId];
        return (p.name, p.owner, p.history.length);
    }
}

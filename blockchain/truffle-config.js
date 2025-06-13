const path = require("path");

module.exports = {
    contracts_build_directory: path.join(__dirname, "build/contracts"),
    networks: {
        development: {
            host: "127.0.0.1",     // Ganache thường chạy trên localhost
            port: 7545,            // Cổng mặc định của Ganache UI
            network_id: "*",       // Khớp với bất kỳ network id nào
        },
    },
    compilers: {
        solc: {
            version: "0.8.28",     // Chỉnh theo phiên bản bạn sử dụng
        }
    }
};

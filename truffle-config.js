
module.exports = {
  networks: {
     development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,   // Standard Ethereum port (default: none)
      network_id: "*",       // Any network (default: none)
     },
  },
    contracts_build_directory: "./src/artifacts/",

  // Configure your compilers
  compilers: {
    solc: {
        version: "^0.4.18",
       // See the solidity docs for advice
       // about optimization and evmVersion
        optimizer: {
          enabled: true,
          runs: 200
        },
        evmVersion: "byzantium"
    }
  }
};
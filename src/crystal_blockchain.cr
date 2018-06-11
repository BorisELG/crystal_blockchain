require "./crystal_blockchain/*"
require "./block"
require "kemal"
#https://medium.com/@bradford_hamilton/write-your-own-blockchain-and-pow-algorithm-using-crystal-d53d5d9d0c52
# TODO: Write documentation for `CrystalBlockchain`
module CrystalBlockchain
   
  blockchain = [] of NamedTuple(
    index: Int32,
    timestamp: String,
    data: String,
    hash: String,
    prev_hash: String
  )

  blockchain << Block.create(0, Time.now.to_s, "Genesis block's data","")

  get "/" do 
    blockchain.to_json
  end
end

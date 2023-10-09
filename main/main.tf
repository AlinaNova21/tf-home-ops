module "bsky" {
  source  = "../modules/bsky"
  cf_zone = "0bdad635ee5d84d61f76d40ffe5a79d6"
  users = {
    "eclipse"      = "did=did:plc:huhuvspzrv3ohy4hxa344pae"
    "elora"        = "did=did:plc:qlk5anh7cq5hzferzad5fazv"
    "gammaboo"     = "did=did:plc:ztr3b2ghdbkv6tdwdhqjhnfx"
    "gremmything"  = "did=did:plc:crzspx34am45biiawqxlpoay"
    "xenodalizard" = "did=did:plc:egv2hxrryzkvhwoj7whpwv7x"
    "zombr1fic"    = "did=did:plc:ymgtutthihoqbitwhxdmuvp3"
    "zomzom"       = "did=did:plc:nz5mf6v7pjmwaevtyfswunlb"
  }
}

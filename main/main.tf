module "bsky" {
  source  = "../modules/bsky"
  cf_zone = "0bdad635ee5d84d61f76d40ffe5a79d6"
  users = {
    "eclipse"      = "did:plc:huhuvspzrv3ohy4hxa344pae"
    "elora"        = "did:plc:qlk5anh7cq5hzferzad5fazv"
    "gammaboo"     = "did:plc:ztr3b2ghdbkv6tdwdhqjhnfx"
    "gremmything"  = "did:plc:crzspx34am45biiawqxlpoay"
    "xenodalizard" = "did:plc:egv2hxrryzkvhwoj7whpwv7x"
    "zombr1fic"    = "did:plc:ymgtutthihoqbitwhxdmuvp3"
    "zomzom"       = "did:plc:nz5mf6v7pjmwaevtyfswunlb"
  }
}

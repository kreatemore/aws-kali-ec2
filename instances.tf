module "kali" {
  source = "./infrastructure"

  my_ip          = "84.0.0.61"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCuB7eqIMt5NhBfZnomMZEl/WVSNoMNEXjA1yM+jARYQbacT+e1+5wLjEvwTvTWU9pvIcXDXtemNQKVZKJT3Yob9faY1GzJNrdV1zVstpnnIMvDKXCs8Xht7J8m0Ogb6WOivEZmmPrFFBioNNz1ez3e2ZakcP7TKsbdBqYNRttitk7l0Df3G3zNCULr3YKtIg+uB9HVCHhkCKRKgWctvdebdxoCq6hOtugmsdgVVtdz61wdQMdvCYhkZDf2nf2O69DHwpggza0HWkmNm2g/oyC00+zpQjcKEfPQXZ/KeXVF3Ff8GEVtOtFnTGMgMB3jzo/4FVJ2x9851caByMENus3lzjJYnq4NiwIsqnJK1m2hzpvz1QLWgP0IKZDf2cEnvyH0vRDyWGqQelsYchqL0DBhBLNKaWvWggu6ncCymzsvkelJoT9QQASfm50hHMZ145ZvR0+6lxH4VtSVH/nkf3P1xXqVbXw1yWX2CFIDSjLuIJ6DoB1/5i0UwBIUbz7y9ZI0jDAeM9HUIqvdlNutRXyJFg2xs8QMUYdVBVtJBQ1Gs3kih8h9t+ZhlCX0Q/Al21Ms1zxDQlZlyixR3UA/5Se4MK9oJUmv6BtMfUJcW9WUeW0yi2H6rmQGPiRvqLHfaMg9vydMzgiCfECogu1CAC6Qv60xWtVnSGB3fG2eZ+L6Fw== me@device.local"
}

output "connection_string" {
  value = module.kali.connection_cmd
}

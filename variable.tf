variable "set" {
    type = set(string)
    description = "Set is not allow duplicate values"
  

}
variable "role_name" {
    type = list(string)
    description = "Role _name try to create a role with count"
}

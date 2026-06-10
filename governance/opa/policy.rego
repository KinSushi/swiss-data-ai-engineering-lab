package swissdataai.policy

default allow = false

allow {
  input.environment == "development"
  not input.contains_real_client_data
}

# Wazuh as a Service

## [Wazuh Dashboard](https://${env.domain}:443)

### Information

#### Access

* URL: ${env.domain}
* URL: ${nodes.wazuh[0].url}
* Public IP address: ${nodes.wazuh[0].extIPs[0]}

#### Ports

* Wazuh TCP [1514,1515]
* Wazuh UDP [1514]
* Elasticsearch HTTP [9200]
* Kibana HTTPS [443]

### Licensing

You will need to provide your own licence as provided/required by the software vendor.
[Wazauh Licence Agreement](https://github.com/wazuh/wazuh/blob/master/LICENSE)


https://wazuh.za.cloudlet.cloud/
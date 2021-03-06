#### [Wazuh Dashboard](https://node${nodes.wazuh[0].id}-${env.domain}:443)

### Information

#### Access

* URL: `https://node${nodes.wazuh[0].id}-${env.domain}:443`
* Public IP address: `${nodes.wazuh[0].extIPs[0]}`

#### Ports

* Wazuh TCP [1514,1515]
* Wazuh UDP [1514]
* Wazuh API [55000]
* Elasticsearch HTTP [9200]
* Kibana HTTPS [443]

### Licensing

You will need to provide your own licence as provided/required by the software vendor.
[Wazuh Licence Agreement](https://github.com/wazuh/wazuh/blob/master/LICENSE)

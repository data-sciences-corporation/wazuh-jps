# Change user passwords
The process to change the password with a Wazuh docker deployment is the following:

## 1\. Change default admin password in docker-compose.yml

**If** you are changing the admin user's password, you must modify the docker-compose's admin passwords.
*Remember to also modify all instances of the `password` environment variables (e.g `ELASTICSEARCH_PASSWORD`)*

## 2\. Access the elasticsearch node

```bash
docker-compose exec elasticsearch bash
```

This should give you a shell inside `/usr/share/elasticsearch`

## 3\. Move to the opendistro_security directory

In `/usr/share/elasticsearch/plugins/opendistro_security` give the `tools/hash.sh` script the proper permissions:

```bash
chmod 764 tools/hash.sh
```

## 4\. Create a new hash for your password:

```bash
tools/hash.sh -p [NEW_PASSWORD]
```

## 5\. Insert new hash into internal_users.yml

Edit `/usr/share/elasticsearch/plugins/opendistro_security/securityconfig/internal_users.yml`

### For your desired user, update the hash.

```yaml
admin:
  hash: "<your_new_hash_here>"
  reserved: true
  backend_roles:
  - "admin"
  description: "Demo admin user"
```

## 6\. Update certificates:
You can now update the certificate/security information, based on that hash.
```bash
tools/securityadmin.sh -f securityconfig/internal_users.yml -icl -nhnv \
  -cacert ../../config/root-ca.pem \
  -cert ../../config/kirk.pem \
  -key ../../config/kirk-key.pem
```

> This is example is with the default certificates, if you are using custom ones, you will need to change the paths with yours.

After that, you should have the following output or similar from the securityadmin:

```bash
Open Distro Security Admin v7
Will connect to localhost:9300 ... done
Connected as CN=kirk,OU=client,O=client,L=test,C=de
Elasticsearch Version: 7.10.0
Open Distro Security Version: 1.12.0.0
Contacting elasticsearch cluster 'elasticsearch' and wait for YELLOW clusterstate ...
Clustername: wazuh-cluster
Clusterstate: YELLOW
Number of nodes: 1
Number of data nodes: 1
.opendistro_security index already exists, so we do not need to create one.
Populate config from /usr/share/elasticsearch/plugins/opendistro_security
Will update '_doc/internalusers' with securityconfig/internal_users.yml
   SUCC: Configuration for 'internalusers' created or updated
Done with success
```

> You can also save the internal_users.yml file and mount it as a volume when bootstrapping new clusters.

## 7\. Reload containers from docker-compose

Exit the elasticsearch container and re-run the docker-compose up command.

```bash
docker-compose up -d
```

CREATE (:Client {client_id: 'C001'})-[:OWNS]->(:Account {account_id: 'A001'});
CREATE (:Client {client_id: 'C002'})-[:USES_DEVICE]->(:Device {device_id: 'D_SHARED'});
CREATE (:Client {client_id: 'C003'})-[:USES_DEVICE]->(:Device {device_id: 'D_SHARED'});

MATCH (c:Client)-[:USES_DEVICE]->(d:Device)<-[:USES_DEVICE]-(other:Client)
WHERE c.client_id <> other.client_id
RETURN c.client_id, d.device_id, collect(other.client_id) AS connected_clients;

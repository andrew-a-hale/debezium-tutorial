$headers = @{ 
    "Content-Type" = "application/json" 
    "Accept" = "application/json"
}
$body = @{
    "connector.class" = "io.debezium.connector.mysql.MySqlConnector"
    "tasks.max" = "1"
    "database.hostname" = "mysql-replica"
    "database.port" = "3306"
    "database.user" = "debezium"
    "database.password" = "dbz"
    "database.server.id" = "184054"
    "topic.prefix" = "dbserver1"
    "database.include.list" = "inventory"
    "schema.history.internal.kafka.bootstrap.servers" = "kafka:9092"
    "schema.history.internal.kafka.topic" = "schema-changes.inventory"
} | ConvertTo-Json
Invoke-WebRequest -Uri 'http://localhost:8083/connectors/inventory-connector/config' -Method Put -Headers $headers -Body $body
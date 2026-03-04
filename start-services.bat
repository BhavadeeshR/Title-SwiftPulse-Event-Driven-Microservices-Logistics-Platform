@echo off
echo Starting SwiftPulse Logistics Platform...
echo.
echo Infrastructure is already running via Docker Compose
echo.

echo Starting Discovery Server (Port: 8761)...
start "Discovery Server" cmd /k "cd infrastructure\discovery-server && java -cp src\main\java com.swiftpulse.discovery.DiscoveryServerApplication"

timeout /t 10

echo Starting Config Server (Port: 8888)...
start "Config Server" cmd /k "cd infrastructure\config-server && java -cp src\main\java com.swiftpulse.config.ConfigServerApplication"

timeout /t 10

echo Starting API Gateway (Port: 8080)...
start "API Gateway" cmd /k "cd infrastructure\api-gateway && java -cp src\main\java com.swiftpulse.gateway.ApiGatewayApplication"

timeout /t 10

echo Starting Identity Service (Port: 8081)...
start "Identity Service" cmd /k "cd services\identity-service && java -cp src\main\java com.swiftpulse.identity.IdentityServiceApplication"

timeout /t 10

echo Starting Order Service (Port: 8082)...
start "Order Service" cmd /k "cd services\order-service && java -cp src\main\java com.swiftpulse.order.OrderServiceApplication"

timeout /t 10

echo.
echo All services are starting...
echo.
echo Access Points:
echo - Web Portal: http://localhost:3000 (run separately with npm start)
echo - API Gateway: http://localhost:8080
echo - Eureka Dashboard: http://localhost:8761
echo - Config Server: http://localhost:8888
echo - Zipkin: http://localhost:9411
echo - Prometheus: http://localhost:9090
echo.
echo Press any key to exit...
pause

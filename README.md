# Microservices E-commerce Application

This repository contains the code for a microservices-based E-commerce application. The application is designed to showcase the interactions between microservices and utilizes various architectural styles, including REST, gRPC, and GraphQL.

## Requirements

To run and develop the E-commerce application, ensure that you have the following requirements installed:

1. **Flutter**: Flutter is used for the client-side development of the application's user interface. Make sure you have Flutter installed on your development machine. For installation instructions, refer to the official Flutter documentation: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. **Serverpod**: Serverpod is the framework used for building the server-side microservices. It provides tools and utilities to facilitate the development and deployment of microservices. To install Serverpod, follow the instructions in the Serverpod documentation: [Serverpod Documentation](https://serverpod.io/docs/)

3. **Docker**: Docker is used for containerization and deployment of the microservices. It provides a consistent and isolated environment for running the microservices and their dependencies. Install Docker by following the instructions specific to your operating system: [Docker Installation Guide](https://docs.docker.com/get-docker/)

## Architectures

The following architectures have been chosen for the implementation of the microservices:

1. REST (Representational State Transfer):
   - Advantages:
     - Widely used and well-known architecture, facilitating integration with other systems.
     - Flexibility in choosing programming languages and technologies.
     - Use of standard HTTP APIs simplifies integration and interoperability.
   - Disadvantages:
     - Synchronous communication can result in higher latency.
     - Lack of strict API contract specification may pose challenges in documentation and validation.

2. gRPC (Google Remote Procedure Call):
   - Advantages:
     - Efficient communication based on the gRPC binary protocol, offering high performance and low latency.
     - Support for multiple programming languages with automatic code generation.
     - Protobuf serialization provides efficient bandwidth utilization and facilitates API evolution.
   - Disadvantages:
     - Requires specific protocol and serialization, potentially requiring a learning curve.
     - Additional configurations may be needed for secure connections.

3. GraphQL:
   - Advantages:
     - Enables clients to request specific data they need, reducing over-fetching and under-fetching.
     - Strongly typed schema allows for compile-time validation.
     - Real-time subscriptions enable receiving data updates in real-time.
   - Disadvantages:
     - Requires additional setup and infrastructure for the GraphQL server and schema.
     - Increased complexity compared to REST in terms of server implementation and caching strategies.

## Application Design

The application is a simple E-commerce platform consisting of the following microservices:

1. Product microservice:
   - Responsible for managing products, including creation, reading, updating, and deletion.
   - Utilizes REST, gRPC, and GraphQL for communication with other microservices.
   - Provides endpoints for product CRUD operations.

2. Order microservice:
   - Manages the customer order process, including creation, reading, updating, and deletion.
   - Communicates with the product microservice to retrieve product information.
   - Utilizes REST, gRPC, and GraphQL for communication with other microservices.
   - Provides endpoints for order CRUD operations.

## Serverpod Project Structure

The Serverpod project is structured into the following components:

1. ecommerce_client:
   - This component includes the client-side code for interacting with the microservices.
   - It provides SDKs, libraries, or code snippets to facilitate communication with the microservices using REST, gRPC, or GraphQL.

2. ecommerce_flutter:
   - This component contains the Flutter-based user interface for the E-commerce application.
   - It utilizes the ecommerce_client component to communicate with the microservices and display the relevant data and user interface elements.

3. ecommerce_server:
   - This component includes the server-side code for the microservices.
   - It implements the business logic, communication protocols, and endpoints for the product and order microservices.
   - The microservices in this component utilize the chosen architectural styles (REST, gRPC, GraphQL) for communication with each other.

## Implementation

The microservices have been implemented using the chosen architectures. Each microservice provides specific functionality and communicates with other microservices appropriately. Relevant libraries, frameworks, and tools have been utilized to facilitate development and communication between microservices.

Please refer to the documentation and code for more details on the microservices and their implementation.

## Getting Started

To run the microservices application locally, follow these steps:

1. Clone the repository: `git clone https://github.com/FadiChaalab/ecommerce-grpc-graphql-restapi.git`

2. Install dependencies:
- Navigate to the `ecommerce_server` directory and run:
  ```
  dart pub get
  ```
- Navigate to the `ecommerce_flutter` directory and run:
  ```
  flutter pub get
  ```

3. Run the Serverpod server:
- Ensure that Docker is running on your machine.
- Navigate to the `ecommerce_server` directory and run:
  ```
  docker-compose up --build --detach
  dart bin/main.dart
  ```
  This command will start the Serverpod server and set up the required services. 

4. Start the microservices:
- To run the product service, navigate to `ecommerce_server/lib/src/microservices` and run:
  ```
  dart product_service.dart
  ```

- To run the order service, navigate to `ecommerce_server/lib/src/microservices` and run:
  ```
  dart order_service.dart
  ```

- To run the GraphQL server, navigate to `ecommerce_server/lib/src/graphql` and run:
  ```
  dart graphql_server.dart
  ```

5. Test the REST API using the Flutter UI:
- Navigate to the `ecommerce_flutter` directory and run:
  ```
  flutter run
  ```
  This command will launch the Flutter application, allowing you to interact with the E-commerce platform via the REST API.

Ensure that all the necessary services are running and accessible, and you should be able to test and explore the features of the E-commerce application.

Please note that you may need to modify certain configurations or endpoints based on your specific setup and requirements.



## Contributing

Contributions are welcome! If you'd like to contribute to the project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature-name`
3. Make your modifications and commit them: `git commit -m 'Add some feature'`
4. Push your branch to the forked repository: `git push origin feature-name`
5. Submit a pull request detailing your changes.

Please ensure that your contributions adhere to the project's coding style and guidelines.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

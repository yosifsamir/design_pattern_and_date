/*
  * The Singleton design pattern is a Creational pattern that ensures that only one instance of a class is created and provides a global point of access to that instance.
  * that means the object is reused all over the application.
  * This pattern is useful when you want to limit the number of instances of a class to one because having multiple instances could lead to issues such as conflicting data.
  *
  * example :- Sure, let's say you have a class called "DatabaseConnection" which is responsible for establishing a connection to a database. If you were to create multiple instances of this class, each instance would establish its own connection to the database.

    Now imagine that you have multiple parts of your code that need to interact with the database.
    If each part of the code creates its own instance of the "DatabaseConnection" class,
    you could end up with multiple connections to the database.
    This could lead to issues such as conflicting data or performance problems due to resource contention.
    By using the Singleton pattern, you can ensure that only one instance of the "DatabaseConnection" class is created and that all parts of your code use the same connection to the database.
    This can help prevent issues such as conflicting data and improve performance by reducing resource contention.
    *
    * ex :- public class DatabaseConnection {
    private static DatabaseConnection instance;
    private Connection connection;

    private DatabaseConnection() {
        // Establish connection to database
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "username", "password");
    }

    public static DatabaseConnection getInstance() throws SQLException {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }
}
*
* public class UserDao {
    public User getUserById(int id) throws SQLException {
        DatabaseConnection dbConnection = DatabaseConnection.getInstance();
        Connection connection = dbConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            User user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("name"));
            user.setEmail(resultSet.getString("email"));
            return user;
        } else {
            return null;
        }
    }
}
*
* if you have any other statements that will interact with database it cannot interact or touch the data until SELECT statement finshed.
* because you used Singleton pattern.
* if you don't use singleton pattern like :- each sql statement will use different connection object that will make conflicting in data and reduce performance. like in multithreading
*
another  example :-
* Using the Singleton pattern with Retrofit can help improve performance and reduce resource contention by ensuring that there is only one instance of the Retrofit client and the HTTP request queue.
* Creating a new instance of the Retrofit client for each API request can be resource-intensive, as it requires establishing a new network connection and allocating memory for the HTTP request queue. This can lead to performance problems such as slow response times and application crashes due to resource exhaustion.
* By using a Singleton class to manage the Retrofit client and the HTTP request queue, you can ensure that there is only one instance of these objects in your application. This can help reduce resource usage and improve performance by reducing the number of network connections and the amount of memory allocated for the HTTP request queue.
* In addition, using a Singleton class can help prevent issues such as conflicting data by ensuring that all parts of your code that make API requests are using the same instance of the Retrofit client. This can help prevent issues such as race conditions and ensure that all API requests are processed in a consistent and predictable manner.
 */

main() {
  Counter counter1= Counter.instance;
  Counter counter2= Counter.instance;
  print("${counter1.hashCode}");
  print("${counter2.hashCode}");
}



class Counter {
  Counter._();
  int _counter = 0;
  static final Counter instance =  Counter._();


  void setter(int counter) {
    _counter = counter;
  }

  int getter() {
    return _counter;
  }

}
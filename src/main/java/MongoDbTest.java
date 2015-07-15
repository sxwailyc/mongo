
import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongoDbTest {

	public static void main(String[] args) {

		long start = System.currentTimeMillis();

		MongoClient client = new MongoClient("127.0.0.1", 27017);

		try {

			MongoDatabase database = client.getDatabase("xba");
			// database.createCollection("user");

			for (int i = 0; i < 10000; i++) {

				MongoCollection<Document> collection = database.getCollection("user");

				Document document = new Document();
				document.put("username", "jackyshi-" + i);
				document.put("username", "用户-" + i);
				collection.insertOne(document);
			}

		} finally {
			client.close();
		}

		System.out.println(System.currentTimeMillis() - start);

	}
}

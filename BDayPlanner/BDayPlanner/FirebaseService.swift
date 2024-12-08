import Firebase

class FirebaseService {
    static let shared = FirebaseService() // Singleton instance
    private let db = Firestore.firestore() // Firestore database reference

    // Save a Birthday Plan
    func saveBirthdayPlan(plan: BirthdayPlan, completion: @escaping (Result<Void, Error>) -> Void) {
        // Map the `BirthdayPlan` data into a dictionary
        let planData: [String: Any] = [
            "theme": plan.theme,
            "activities": plan.activities.map { activity in
                return [
                    "name": activity.name,
                    "location": activity.location,
                    "budget": activity.budget,
                    "description": activity.description,
                    "time": activity.time
                ]
            }
        ]

        // Save the dictionary to the "birthdayPlans" collection
        db.collection("birthdayPlans").addDocument(data: planData) { error in
            if let error = error {
                completion(.failure(error)) // Pass the error to the completion handler
            } else {
                completion(.success(())) // Indicate success
            }
        }
    }

    // Fetch All Birthday Plans
    func fetchBirthdayPlans(completion: @escaping (Result<[BirthdayPlan], Error>) -> Void) {
        db.collection("birthdayPlans").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error)) // Pass the error to the completion handler
                return
            }

            // Safely handle and parse the Firestore snapshot data
            guard let documents = snapshot?.documents else {
                completion(.success([])) // Return an empty array if no documents are found
                return
            }

            var birthdayPlans: [BirthdayPlan] = []

            // Loop through each document to map its data
            for document in documents {
                let data = document.data()
                if let theme = data["theme"] as? String,
                   let activitiesData = data["activities"] as? [[String: Any]] {
                    
                    // Map activities data to `Activity` objects
                    let activities: [Activity] = activitiesData.compactMap { activityData in
                        if let name = activityData["name"] as? String,
                           let location = activityData["location"] as? String,
                           let budget = activityData["budget"] as? Double,
                           let description = activityData["description"] as? String,
                           let time = activityData["time"] as? String {
                            return Activity(name: name, location: location, budget: budget, description: description, time: time)
                        }
                        return nil
                    }

                    // Create and append a `BirthdayPlan`
                    let plan = BirthdayPlan(theme: theme, activities: activities)
                    birthdayPlans.append(plan)
                }
            }

            completion(.success(birthdayPlans)) // Pass the array of plans to the completion handler
        }
    }
}

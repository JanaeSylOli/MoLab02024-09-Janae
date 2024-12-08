import FirebaseFirestore

class FirebaseService {
    private let db = Firestore.firestore()
    
    // Save a birthday plan
    func saveBirthdayPlan(plan: BirthdayPlan, completion: @escaping (Result<Void, Error>) -> Void) {
        let planData: [String: Any] = [
            "theme": plan.theme,
            "activities": plan.activities.map { activity in
                [
                    "name": activity.name,
                    "location": activity.location,
                    "budget": activity.budget,
                    "description": activity.description,
                    "time": activity.time
                ]
            }
        ]
        
        db.collection("birthdayPlans").addDocument(data: planData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Fetch all birthday plans
    func fetchBirthdayPlans(completion: @escaping (Result<[BirthdayPlan], Error>) -> Void) {
        db.collection("birthdayPlans").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = snapshot?.documents else {
                completion(.success([]))
                return
            }
            
            let plans: [BirthdayPlan] = documents.compactMap { doc in
                let data = doc.data()
                guard let theme = data["theme"] as? String,
                      let activitiesData = data["activities"] as? [[String: Any]] else { return nil }
                
                let activities: [Activity] = activitiesData.compactMap { activityData in
                    guard let name = activityData["name"] as? String,
                          let location = activityData["location"] as? String,
                          let budget = activityData["budget"] as? Double,
                          let description = activityData["description"] as? String,
                          let time = activityData["time"] as? String else { return nil }
                    
                    return Activity(name: name, location: location, budget: budget, description: description, time: time)
                }
                
                return BirthdayPlan(theme: theme, activities: activities)
            }
            
            completion(.success(plans))
        }
    }
}

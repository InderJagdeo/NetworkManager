# NetworkManager With URL Session

A simple network manager class with URL Session to get, post, put, and delete data on the server in swift language.

## How to use NetworkManager.swift

Create NetworkManager.swift class instance in your ViewControler.swift class. 

```bash
  let networkManager = NetworkManager()
```

Create your URL request and call NetworkManager request method with your URL request.
```bash
  do {
      let request = try Router.all.requestURL()
      networkManager.request(request) { (result: Result<[Country], Error>) in
        switch result {
        case .success(let countries):
            print("Number of Countries: ", countries.count)
        case .failure(let error):
            if let error = error as? NetworkError {
                let message = ErrorMapper(error: error).message
                    print(message)
                } else {
                    print(error)
                }
            }
       }        
    } catch {
            print("Errors: \(error)")
    }
```


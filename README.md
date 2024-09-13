# Mobile Product Display
AiRLITZApp: Calls content view which is defined in Home.swift

Home.swift: Displays logo, and page for users to pick what file request to send to API

API.swift: creates object for JSON response to parse into. Creates Array of every object returned by API. Constructs GET method to request JSON file dependent on user input in Home.swift

Celebs.swift: Displays every image associated with the URL returned by the API request in a scroll view.

ImageView.swift + ImageViewModel.swift: receives url from every object in the JSON response, and converts that into an image to return to Celebs.swift view constructor or prodDisplay.swift view.

Products.swift: same functionality as API.swift but built to accept a different JSON response. 

prodDisplay.swift: navigated to after user picks the second file to request from API. Built to display images returned by Products.swift.




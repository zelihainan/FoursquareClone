# FoursquareClone (iOS)

An iOS app where users can create and explore location-based entries with photos, details, and comments. Built with **Swift**, **UIKit**, **MapKit**, **CoreLocation**, and **Parse** backend.

## Features
- **User Authentication**: Sign up, log in, and log out.
- **Add New Places**:
  - Name, type, atmosphere/description
  - Image upload from device
  - Location selection on map
- **Home Screen**:
  - View all saved places in a list
  - Tap to see details of each place
- **Place Details**:
  - Full-size image
  - Name, type, and description
  - Map with pinned location
  - Info button to open Apple Maps navigation
- **Data Storage**: All data stored in Parse backend and synced in real time.

## Screenshots
<p align="left">
<img width="190" alt="1" src="https://github.com/user-attachments/assets/1bfe8098-d9b8-40fe-9297-261ad424b64d" />
<img width="190" alt="2" src="https://github.com/user-attachments/assets/8196bb66-16c2-4061-9b60-d9c318436725" />
<img width="190" alt="3" src="https://github.com/user-attachments/assets/d1d884b0-3afe-4f3c-aa01-21a91b66b012" />
<img width="190" alt="4" src="https://github.com/user-attachments/assets/3936e3a8-5dd9-4982-95f5-b8ebf371b018" />
<img width="190" alt="5" src="https://github.com/user-attachments/assets/b5dca56a-8ef7-4a42-8260-8d11b3f28463" />
<img width="190" alt="6" src="https://github.com/user-attachments/assets/f58daf68-625d-4bb1-a0a3-9933fb5f6e31" />
<img width="190" alt="7" src="https://github.com/user-attachments/assets/83dfba45-d8db-4dae-9005-8c5df243a3c9" />
</p>

## Requirements
- Xcode 15+, iOS 15+
- CocoaPods
- Parse Server (e.g., Back4App)

## Setup
```bash
git clone https://github.com/zelihainan/FoursquareClone.git
cd FoursquareClone
pod install
open FoursquareClone.xcworkspace
```
Configure Parse in AppDelegate:
```
let config = ParseClientConfiguration { cfg in
    cfg.applicationId = "YOUR_APP_ID"
    cfg.clientKey    = "YOUR_CLIENT_KEY"
    cfg.server       = "YOUR_SERVER_URL"
}
Parse.initialize(with: config)
```
## Usage
→ Log In / Sign Up  
→ Add a Place:  
      Fill in details (name, type, description)  
      Select an image  
      Pick location on map  
      Save to backend  
→ View on Home Screen:  
      Browse all places  
      Tap to see full details and location  
→ Navigate:  
      Tap the info button on the map to open Apple Maps and get directions.  
→ Log Out when finished.  


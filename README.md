# Date Smarter 
project-g2 created by GitHub Classroom

System Requirements: 

  XCode

  - Google Services use CocoaPods to install and manage dependencies. Open a terminal window and navigate to the location of the Xcode project for the app. 
  - Create a profile if you do not have one:

    $ pod init 

  - Open your profile and add:

    pod 'Firebase/Analytics'

  - Save the file and run: 

    $ pod install 
    
    Running the API:
      Below are the settings needed for the API call to work. This is because the API we're using is HTTP, not HTTPS so the App Transport Security blocks       the unsecure connection, but making these changes below will allow the call to go through.
    
   
    ![alt text](ATS_Settings.png)




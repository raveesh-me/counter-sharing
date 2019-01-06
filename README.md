# BLoC Sharing Counter
A counter app with code sharing between AngularDart and Flutter

* core folder cotains the core logic of the app. It exports the BLoC responsible for providing:
  * A stream of integer to update the view
  * A function to increment on the stream
  
The web(agulardart) and the app(flutter) projects import the core as an external package and use the BLoC's interface 
to provide functionality.


<img src="https://i.ibb.co/Xpsy2TZ/business-logic-sharing.jpg" alt="business-logic-sharing" border="0">

# Workflow
Look at the PRs for a comprehensive step by step of the process

1. Implementing the core functionality with unit tests -> [!1](https://github.com/raveesh-me/counter-sharing/pull/1)
2. Adding the flutter app and modifying the default application to use the core -> [!2](https://github.com/raveesh-me/counter-sharing/pull/2)
3. Adding the AngularDart app, Implementing the counter, and using the core -> [!3](https://github.com/raveesh-me/counter-sharing/pull/3)
4. Closing stream on web (`ngOnDestroy()`) -> [!4](https://github.com/raveesh-me/counter-sharing/pull/4)

# Upcoming
This project will finish with using local storage in respective platforms to persist the counter. That is WIP

/// A value mapping the View UI to the state in the Model.
///
/// This will contain all the possible states for any view, custom enums can be created for separate views if required
enum ViewState {
  idle, // When nothing is happening or just initialized
  busy, // Typically shows a loading indicator of some sorts
  dataFetched, // Indicates that there's data available on the view
  noDataAvailable, // Indicates that data was fetched successfully but nothing is available
  error, // Indicates there's an error on the view
  success, // Successful action occurred
  waitingForInput // The starting state that a form view is in
}

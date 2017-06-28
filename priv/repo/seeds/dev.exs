apps = [%{
  name: "Alher",
  demo_url: nil,
  source_url: "https://github.com/Queertoo/Alher",
  image_url: nil,
  description: "Alher is an IRC bot based on Chatty. It is in charge of Queertoo's IRC channel, alongside other bots."
}, %{
  name: "SprintPoker",
  demo_url: "https://sprintpoker.io",
  source_url: "https://github.com/elpassion/sprint-poker",
  image_url: "https://raw.githubusercontent.com/elpassion/sprint-poker-inesita/master/static/logo-big.png",
  description: "Online estimation tool for Agile teams"
}, %{
  name: "Startup Job",
  demo_url: "http://demo.job-search.tsurupin.com",
  source_url: "https://github.com/tsurupin/job_search",
  image_url: "https://ibin.co/3RO22ohaCLSE.png",
  description: "An app to search startup jobs scraped from websites written in Phoenix, React and styled-components"
}, %{
  name: "Exchat",
  demo_url: "https://exchat-example.herokuapp.com/",
  source_url: "https://github.com/tony612/exchat",
  image_url: nil,
  description: "A Slack-like app by Phoenix & React(redux)"
}, %{
  name: "Exshop",
  demo_url: "https://www.authenticpixels.com",
  source_url: "https://github.com/authentic-pixels/ex-shop",
  image_url: nil,
  description: "Digital goods shop & blog created using Phoenix Framework"
}, %{
  name: "Battleship game",
  demo_url: "https://phoenix-battleship.herokuapp.com",
  source_url: "https://github.com/bigardone/phoenix-battleship",
  image_url: nil,
  description: "The Good Old game, built with Phoenix, React and Redux"
}, %{
  name: "Toggl",
  demo_url: "https://phoenix-toggl.herokuapp.com",
  source_url: "https://github.com/bigardone/phoenix-toggl",
  image_url: nil,
  description: "Toggl tribute done with Phoenix Framework, React and Redux"
}, %{
  name: "Mines",
  demo_url: nil,
  source_url: "https://github.com/kevlar1818/mines",
  image_url: "https://raw.githubusercontent.com/kevlar1818/mines/master/screenshot.png",
  description: "A minesweeper clone in the terminal"
}, %{
  name: "Magnetissimo",
  demo_url: nil,
  source_url: "https://github.com/sergiotapia/magnetissimo",
  image_url: "https://cloud.githubusercontent.com/assets/686715/22401811/388e3b3e-e5b0-11e6-9429-aca85f3ce0b6.png",
  description: "Web application that indexes all popular torrent sites, and saves it to the local database"
}]

for app <- apps do
  %ER.Apps.App{status: "accepted"}
  |> ER.Apps.App.changeset(app)
  |> ER.Repo.insert!
end

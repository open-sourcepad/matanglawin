config = ($stateProvider) ->
  $stateProvider
    .state 'home',
      abstract: true,
      templateUrl: 'modules/home/index.html'

    .state 'home.index',
      url: "/"
      controller: 'Home.Controller',
      templateUrl: 'modules/home/home.html'

config.$inject = ['$stateProvider']
angular.module("client").config(config)

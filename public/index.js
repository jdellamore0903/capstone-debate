/* global Vue, VueRouter, axios */

'________________________________';
var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};
'________________________________';


'________________________________';
var TopicsList = {
  template: "#topics-list",
  data: function() {
    return {
      topics: []
    };
  },
  created: function() {
    axios.get('/topics').then(function(response) {
      console.log(response.data);
      this.topics = response.data;
    }.bind(this));
  },
  methods: {
    redirectCreateTopic: function() {
      return router.push({path: '/create-a-topic'});
    },
    directToDebates: function(inputTopic) {
      console.log(inputTopic.id);
      return router.push({path: '/topic-page/' + inputTopic.id});
    }
  },
  computed: {}
};
'________________________________';

'________________________________';
var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};
'________________________________';

'________________________________';
var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};
'________________________________';

'________________________________';
var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};
'________________________________';

'________________________________';
var CreateTopic = {
  template: "#create-a-topic",
  data: function() {
    return {
      message: "Welcome!",
      topicTitle: ""
    };
  },
  created: function() {},
  methods: {
    createTopic: function() {
      console.log(this.topicTitle);
      var params = {
        topic_title: this.topicTitle
      };
      axios.post('/topics', params).then(
        function(response) {
          console.log(response.data);
        }.bind(this));
    }
  },
  computed: {}
};
'________________________________';

'________________________________';
var TopicPage = {
  template: "#topic-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      topic: "",
      debates: [],
      side: ""
    };
  },
  created: function() {
    axios.get('/topics/' + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.topic = response.data.topic_title;
      this.debates = response.data.debates;
    }.bind(this));
  },
  methods: {
    findFree: function() {
      debates = this.debates;
      freeAffDebates = [];
      freeNegDebates = [];
      for (var i = 0; i < debates.length; i++) {
        if (!debates[i]["open?"]) {
          if (debates[i].aff_user_id) {
            freeNegDebates.push(debates[i]);
          }else {
            freeAffDebates.push(debates[i]);
          }
        }
      }
      //using the free arrays, we want to now update the debate entry to add the new user id
      console.log(freeAffDebates);
      console.log(freeNegDebates);
    }
  },
  computed: {}
};
'________________________________';





var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/topics-list", component: TopicsList },
    { path: "/login", component: LoginPage },
    { path: "/signup", component: SignupPage },
    { path: "/logout", component: LogoutPage },
    { path: '/create-a-topic', component: CreateTopic },
    { path: '/topic-page/:id', component: TopicPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

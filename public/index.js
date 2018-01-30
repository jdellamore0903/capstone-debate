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
    },
    directToDebates: function(inputDebate) {
      console.log(inputDebate.id);
      return router.push({path: '/debate/' + inputDebate.id});
    }
  },
  computed: {}
};
'________________________________';

'________________________________';
var DebatePage = {
  template: "#debate-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      speeches: [],
      structuredArguments: [],
      freeFormArguments: [],
      hideShow: false,
      debateID: 0,
      nextSpeech: ""
    };
  },
  created: function() {
    axios.get('/speeches/by-debate/' + this.$route.params.id).then(function(response) {
      console.log(response.data);
      sortedSpeeches = [];
      for (var i = 0; i < response.data.length; i++) {
        switch (response.data[i].speech_title) {
          case "1AC":
            sortedSpeeches[0] = response.data[i];
            sortedSpeeches[0]["show"] = false;
            break;
          case "1NC":
            sortedSpeeches[1] = response.data[i];
            sortedSpeeches[1]["show"] = false;
            break;
          case "2AC":
            sortedSpeeches[2] = response.data[i];
            sortedSpeeches[2]["show"] = false;
            break;
          case "2NC":
            sortedSpeeches[3] = response.data[i];
            sortedSpeeches[3]["show"] = false;
            break;
          case "1AR":
            sortedSpeeches[4] = response.data[i];
            sortedSpeeches[4]["show"] = false;
            break;
          case "1NR":
            sortedSpeeches[5] = response.data[i];
            sortedSpeeches[5]["show"] = false;
            break;
        }
      }
      this.speeches = sortedSpeeches;
      console.log(this.speeches[this.speeches.length - 1]);
      this.debateID = this.speeches[this.speeches.length - 1].debate_id;
      var speechOrder = ["1AC", "1NC", "2AC", "2NC", "1AR", "1NR"];
      this.nextSpeech = speechOrder[speechOrder.indexOf(this.speeches[this.speeches.length - 1].speech_title) + 1];
    }.bind(this));
  },
  methods: {
    showStuff: function(inputSpeech) {
      return inputSpeech.show = !inputSpeech.show;
    },
    createASpeech: function() {
      return router.push({path: '/create-speech/' + this.debateID + '/' + this.nextSpeech});
    }
  },
  computed: {}
};
'________________________________';

'________________________________';
var CreateSpeech = {
  template: "#create-a-speech",
  data: function() {
    return {
      message: "Welcome!",
      debateID: 0,
      speech: "",
      speechID: 0,
      completedStructured: [],
      completedFreeForm: [],
      completedCards: [],
      structuredArgumentsForm: [],
      freeFormsForm: [],
      cardsForm: [],
      argumentName: "",
      cardTag: "",
      authorFirst: "",
      authorLast: "",
      articleTitle: "",
      articleDate: "",
      URL: "",
      cardText: "",
      cardCommit: false,
      freeFormText: ""
    };
  },
  created: function() {
    this.debateID = this.$route.params.id;
    this.speech = this.$route.params.speech;
  },
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
    },
    addStructured: function() {
      if (this.structuredArgumentsForm.length < 1) {
        this.structuredArgumentsForm.push({
          text: "Argument Name"
        });
      }  
    },
    addFreeForm: function() {
      if (this.freeFormsForm.length < 1) {
        this.freeFormsForm.push({
          text: "Argument Text"
        });
      }
    },
    commitStructured: function() {
      this.completedStructured.push(this.argumentName);
      console.log(this.completedStructured);
    },
    addCards: function() {
      this.completedStructured.push({title: this.argumentName, cards: []});
      this.structuredArgumentsForm = [];
      this.cardsForm.push({
        text1: "Tag",
        text2: "Author First Name",
        text3: "Author Last Name",
        text4: "Article Title",
        text5: "Article Date",
        text6: "URL",
        text7: "Card Text"
      });
    },
    addCard: function() {
      console.log(this.completedStructured.length);
      console.log(this.completedStructured);
      this.completedStructured[this.completedStructured.length - 1].cards.push({
        tag: this.cardTag,
        authorFirst: this.authorFirst,
        authorLast: this.authorLast,
        articleTitle: this.articleTitle,
        articleDate: this.articleDate,
        URL: this.URL,
        cardText: this.cardText
      });
      console.log(this.completedStructured);
      this.cardCommit = true;
      this.cardTag = "";
      this.authorFirst = "";
      this.authorLast = "";
      this.articleTitle = "";
      this.articleDate = "";
      this.URL = "";
      this.cardText = "";
    },
    finishedCard: function() {
      this.cardsForm = [];
      this.argumentName = "";
    },
    addFreeFormArgument: function() {
      this.completedFreeForm.push({
        text: this.freeFormText
      });
      this.freeFormText = "";
    },
    commitSpeech: function() {
      this.completedStructured.unshift({
        debate_id: this.debateID,
        speech: this.speech
      });
      axios.post('/create-speeches', this.completedStructured).then(
        function(response) {
          this.speechID = response.data.id;
        }.bind(this));
      return router.push({path: '/debate/' + this.debateID});
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
    { path: '/topic-page/:id', component: TopicPage },
    { path: '/debate/:id', component: DebatePage},
    { path: '/create-speech/:id/:speech', component: CreateSpeech}
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

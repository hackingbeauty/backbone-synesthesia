(function($){
  
  window.Neuron = Backbone.Model.extend({
    url: function() {
      return this.id ? '/neurons/' + this.id : '/neurons'; //Ternary, look it up if you aren't sure
    },
    defaults:{
      neuron: {
        body: "No information entered",
        url: "none"
      }
    },
    initialize: function(){
      //Can be used to initialize Model attributes
    }
  });

  window.NeuronCollection = Backbone.Collection.extend({
    model: Neuron,
    url: '/neurons'
  });

  window.Neurons = new NeuronCollection;

  window.NeuronView = Backbone.View.extend({
    tagName: "li",
    events: {
        //Can be used for handling events on template 
    },
    initialize: function(){
      //this.render();
    },
    render: function(){
      console.log('inside render');
      console.log(this.model);
      // console.log(this.model.toJSON());
      var neuron = this.model.toJSON();
      //Template stuff goes here
      $(this.el).html(ich.neuron_template(neuron));
      return this;
    }
  });

  window.AppView = Backbone.View.extend({
    el: $('#neurons_app'),
    events:{
      'submit form#new_neuron':'createNeuron'
    },
    initialize: function(){
      _.bindAll(this, 'addOne', 'addAll');
      Neurons.bind('add', this.addOne);
      Neurons.bind('refresh', this.addAll);
      Neurons.bind('all', this.render);
      Neurons.fetch(); //This gets the model from the server
    },
    addOne: function(neuron) {
       var view = new NeuronView({model: neuron});
       this.$("#neurons_list").append(view.render().el);
     },

     addAll: function(){
       Neurons.each(this.addOne);
     },
    newAttributes: function(event){
      var new_neuron_form = $(event.currentTarget).serializeObject();
      return {
        neuron: {
          body: new_neuron_form['neuron[body]'],
          url: new_neuron_form['neuron[url]']
        }
      }
    },
    createNeuron: function(e){
      e.preventDefault();
      var params = this.newAttributes(e);
      Neurons.create(params);
    }
  });

  window.App = new AppView;

}(jQuery));

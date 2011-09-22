var neuronData = [{
  body: 'my body',
  url: 'http://cnn.com'
}, {
  body: 'my body 2',
  url: 'http://google.com'
}, {
  body: 'my body 3',
  url: 'http://nytimes.com'
}]

describe('Neuron', function(){
  beforeEach(function(){
    this.neuron = new Neuron(neuronData[0]);
  })
  
  it('creates from data', function(){
    expect(this.neuron.get('body')).toEqual('my body');
    expect(this.neuron.get('url')).toEqual('http://cnn.com');
  })
})
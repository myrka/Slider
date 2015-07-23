Slider = React.createClass(
    interval_handler: null
    getInitialState: () -> 
        image_index: 0
    componentDidMount: () -> 
        @start()
    showNextImage: () ->
      new_index = if @state.image_index isnt @props.images.length - 1 then @state.image_index + 1 else 0
      @setState image_index: new_index  
    showPrevImage: () ->
      new_index = if @state.image_index is @props.images.length - 1 then @state.image_index + 1 else 0
      @setState image_index: new_index 
    start: () -> 
        @interval_handler = setInterval @showNextImage, @props.interval
    pause: () -> 
        clearInterval @interval_handler

  
    render: () ->        
        <div id="slider"
        style={{ backgroundImage: 'url(' + @props.images[@state.image_index] + ')' }}
        onMouseOver={@pause}
        onMouseOut={@start}>
        <button onClick = {@.showNextImage}>></button>
        <button onClick = {@.showPrevImage}><</button>
        </div>
)

document.addEventListener 'DOMContentLoaded',() ->
    React.render <Slider images={[ 'imgs/1.jpg', 'imgs/2.jpg', 'imgs/3.jpg' ]} interval={2000}/>,
    document.getElementById 'app-container'
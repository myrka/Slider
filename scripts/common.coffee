Slider = React.createClass(

  getInitialState: () -> 
    image_index: 0

  componentDidMount: ()-> 
    @start()

  interval_handler: null

  showNextImage: () ->
    new_index = if @state.image_index isnt @props.images.length - 1
      @state.image_index + 1
    else 
      0

    @setState image_index: new_index

  showPrevImage: () ->
    new_index = if @state.image_index isnt 0
      @state.image_index - 1
    else 
      @props.images.length - 1

    @setState image_index: new_index

  start: () -> 
    @interval_handler = setInterval @showNextImage, @props.interval

  pause: () -> 
    clearInterval @interval_handler

  render: () ->
    <div    id="slider"
            style={ backgroundImage: 'url(' + @props.images[@state.image_index] + ')'}
            onMouseOver={@pause}
            onMouseOut={@start}>
        <div    className='btn left-btn'
                onClick={@showPrevImage}><</div>
        <div    className='btn right-btn'
                onClick={@showNextImage}>></div>
    </div>
)

images = [
    'imgs/1.jpg',
    'imgs/2.jpg',
    'imgs/3.jpg'
]

document.addEventListener 'DOMContentLoaded', () ->
    React.render <Slider images={images} interval={3000} />,
    document.getElementById 'app-container'
command: "bash docker-status.widget/helper.sh getContainers"

style: """
  color: rgba(255, 255, 255, 1.0)
  font-family: Helvetica Neue, Arial
  text-shadow:0px 0px 20px rgba(0,0,0,0.3);
  font-smoothing: antialiased
  font-weight: 700
  font-size: 1.3em

  #wrapper
    margin-left: 20px
    margin-top: 20px

  #containers
    display: flex
    flex-direction: row

  span
    margin-bottom: 5px

  #names
    margin-right: 15px

  #ports
    margin-left: 10px

  .containerName
    display: block

  .containerPort
    display: block

  .icons
    margin-left: 5px
    margin-right: 5px

"""

refreshFrequency: '5s'

render: -> """
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.css">
  <div id="wrapper">
    <div id="containers">
      <div id="names"></div>
      <div id="ports"></div>
    </div>
  </div>
"""

update: (output, domEl) ->

  containers = JSON.parse("[" + output.slice(0, -2) + "]")
  containersName = (
    """
        <span class="containerName">#{container.name}
    """ for container in containers)
  containersPort = (
    """
        <span class="containerPort">
          #{container.port.replace("/tcp", "").replace("->", "<span><i class='icon-shuffle icons'></i></span>")}
        </span>
    """ for container in containers)

  $(domEl).find('#names').html(containersName)
  $(domEl).find('#ports').html(containersPort)

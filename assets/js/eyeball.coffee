$ ->
	$('#add_server_form').submit ->
		name = $("#server_name")[0].value
		url = $("#server_url")[0].value
		port = $("#server_port")[0].value
		server_config = {server_name:name, server_url:url, server_port:port}
		stored_servers = $.jStorage.get('servers')
		is_there_already = false
		if(!stored_servers)
			stored_servers = []
			stored_servers.push server_config	
		else
			for server in stored_servers
				if server['server_name'] is name and server['server_url'] is url
					is_there_already = true

			if !is_there_already
				stored_servers.push server_config

		$.jStorage.set 'servers', stored_servers
		if !is_there_already
			$("#server_name").val('')
			$("#server_url").val('')
			$("#server_port").val('')
		else
			console.log "server already there!"
		return false
defmodule Web.RoomChannel do
	use Phoenix.Channel

	def join("room:lobby", _message, socket) do
		{:ok, socket}
	end
	def join("room:" <> _private_room_id, _params, _socket) do
		{:error, %{reason: "unauthorized"}}
	end

	def handle_in("new_msg", %{"name" => name, "body" => body, "isSystem" => is_system}, socket) do
		broadcast! socket, "new_msg", %{name: name, body: body, is_system: is_system}
		{:noreply, socket}
	end

	def handle_out("new_msg", payload, socket) do
		push socket, "new_msg", payload
		{:noreply, socket}
	end
end

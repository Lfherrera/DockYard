defmodule PicChatWeb.MessageLive.FormComponent do
  use PicChatWeb, :live_component

  alias PicChat.Messages

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage message records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="message-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:content]} type="text" label="Content" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Message</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{message: message} = assigns, socket) do
    changeset = Messages.change_message(message)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"message" => message_params}, socket) do
    changeset =
      socket.assigns.message
      |> Messages.change_message(message_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"message" => message_params}, socket) do
    save_message(socket, socket.assigns.action, message_params)
  end

  # This form is used to initialize form data and display errors. Observe the :error case when
  # creating a new message. The assign_form/2 function works with the changeset to display errors.
  defp save_message(socket, :edit, message_params) do
    case Messages.update_message(socket.assigns.message, message_params) do
      {:ok, message} ->
        notify_parent({:saved, message})

        {:noreply,
         socket
         |> put_flash(:info, "Message updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_message(socket, :new, message_params) do
    case Messages.create_message(message_params) do
      {:ok, message} ->
        notify_parent({:saved, message})

        {:noreply,
         socket
         |> put_flash(:info, "Message created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  # The FormComponent uses an assign_form/2 helper function to assign the Phoenix.HTML.Form struct in the socket
  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  # The FormComponent also provides an example of sending the parent LiveView
  # process a message when a new Message is created.

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

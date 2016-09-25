defmodule Web.Link do
  use Web.Web, :model

  schema "links" do
    field :host, :string
    field :path, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:host, :path])
    |> validate_required([:host, :path])
  end
end

defmodule ER.Apps.App do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:id, :name, :demo_url, :source_url, :image_url,
                                    :description, :status, :created_at]}
  schema "apps" do
    field :name, :string
    field :demo_url, :string
    field :source_url, :string
    field :image_url, :string
    field :description, :string
    # submitted | accepted | declined
    field :status, :string, default: "submitted"

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = app, attrs) do
    unique_error_message = fn field -> "App with this #{field} have already been submitted" end
    app
    |> cast(attrs, [:name, :demo_url, :source_url, :image_url, :description])
    |> validate_required([:name, :source_url, :description])
    |> unique_constraint(:name, message: unique_error_message.("name"))
    |> unique_constraint(:demo_url, message: unique_error_message.("demo URL"))
    |> unique_constraint(:source_url, message: unique_error_message.("source URL"))
    |> unique_constraint(:image_url, message: unique_error_message.("image URL"))
  end
end

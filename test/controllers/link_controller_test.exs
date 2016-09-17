defmodule Web.LinkControllerTest do
  use Web.ConnCase

  alias Web.Link
  @valid_attrs %{host: "some content", path: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, link_path(conn, :create), link: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, link_path(conn, :create), link: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    link = Repo.insert! %Link{}
    conn = put conn, link_path(conn, :update, link), link: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    link = Repo.insert! %Link{}
    conn = put conn, link_path(conn, :update, link), link: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    link = Repo.insert! %Link{}
    conn = delete conn, link_path(conn, :delete, link)
    assert response(conn, 204)
    refute Repo.get(Link, link.id)
  end
end

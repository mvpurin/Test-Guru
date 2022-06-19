module SessionsHelper
  def logout
    link_to 'Log out',
                logout_path(session),
                method: :get,
                data: {confirm: 'Are you sure?'}
  end
end

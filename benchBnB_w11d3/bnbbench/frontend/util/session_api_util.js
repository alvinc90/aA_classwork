//configuration object

//data. import to think about how backend is expecting data

// {user: {:username, }}

export const signup = (user) => {
  return (
    $.ajax({
      method: 'POST',
      url: '/api/users',
      data: { user }
    })
  )
}
//configuration object

//data. import to think about how backend is expecting data

// {user: {:username, }}

export const signUp = (user) => {
  return (
    $.ajax({
      method: 'POST',
      url: '/api/users',
      data: { user }
    })
  )
}

export const signIn = (user) => {
  return (
    $.ajax({
      method: 'POST',
      url: '/api/sessions',
      data: { user }
    })
  )
}

export const signOut = () => {
  return (
    $.ajax({
      method: 'DELETE',
      url: '/api/sessions'
    })
  )
}



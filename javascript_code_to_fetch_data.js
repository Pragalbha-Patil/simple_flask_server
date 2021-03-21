// running this code will fetch data from Flask server and console log it. (put in script)

var myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");
myHeaders.append("Accept", "application/json");

var raw = JSON.stringify({"latitude":19.4522,"longitude":72.8078,"distance_in_kms":100});

var requestOptions = {
  method: 'POST',
  headers: myHeaders,
  body: raw,
  redirect: 'follow'
};

fetch("http://127.0.0.1:5000/search", requestOptions)
  .then(response => response.text())
  .then(result => {
      console.log(result);
      const clinic_data = result.data // will hold data to further manipulate stuff.
  })
  .catch(error => console.log('error', error));
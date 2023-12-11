

const phoneNumber = document.getElementById("phoneNumber").value;
const appVerifier = window.recaptchaVerifier;

signInWithPhoneNumber(auth, "+82" + phoneNumber, appVerifier)
    .then((confirmationResult) => {
      // SMS sent. Prompt user to type the code from the message, then sign the
      // user in with confirmationResult.confirm(code).
      window.confirmationResult = confirmationResult;
	console.log(confirmationResult)
      // ...
    }).catch((error) => {
	console.log(error)
      // Error; SMS not sent
      // ...
    });
});

 document
        .getElementById("confrimCodeButton")
        .addEventListener("click", (event) => {
          event.preventDefault();
          const code = document.getElementById("confirmCode").value;
          confirmationResult
  
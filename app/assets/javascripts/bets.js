$(document).on('turbolinks:load', function() {
  updateSummary();  
  $('.new-bet-select').change(updateSummary);

  $('.bet').click(function() {
    $(this).find('.placements').toggle();
  });
  $('.summary').click(function() {
    $('.summary-content').toggle();
    if ($(".summary-content").css("display") === "none") {
      $(".expandable-sign").text("+");
    } else {
      $(".expandable-sign").text("-");
    }
  }); 

  function updateSummary() {
    let placementBets = document.getElementsByTagName("select");

    // Gather contestants
    let contestants = [];
    for (let i = 1 ; i < placementBets[0].length ; i++) {
      contestants.push(placementBets[0].options[i].innerHTML);
    }

    // Gather currenlty selected contestants in form
    let selectedContestants = [];
    for (let i = 0 ; i < placementBets.length ; i++) {
      let selectedIndex = placementBets[i].selectedIndex;
      if (selectedIndex) selectedContestants.push(placementBets[i][selectedIndex].innerHTML);
    }

    //Append missing contestants to summary
    let ul = document.getElementById("summary-content-new-bets");
    ul.innerHTML = "";
    contestants = contestants
      .filter((c) => !selectedContestants.includes(c))
      .forEach(function(c) {
        let li = document.createElement('li');
        li.innerHTML = c;
        ul.appendChild(li);
    })
  }
});
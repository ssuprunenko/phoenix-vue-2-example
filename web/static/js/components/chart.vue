<template>
  <div>
    <button v-on:click="redrawChart">Redraw!</button>
    <canvas id="myChart" width="700" height="300"></canvas>
  </div>
</template>

<script>
export default {
  data() {
    return {
      myChart: null,
      chartData: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
          label: '# of Votes',
          data: [12, 19, 3, 5, 2, 3],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      }
    };
  },

  mounted() {
    this.drawChart()
  },

  methods: {
    drawChart() {
      var ctx = document.getElementById("myChart")
      this.myChart = new Chart(ctx, {
        type: "bar",
        data: this.chartData,
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero:true
              }
            }]
          }
        }
      })
    },
    redrawChart() {
      this.chartData.datasets[0].data = [
        ~~(Math.random() * 20),
        ~~(Math.random() * 20),
        ~~(Math.random() * 20),
        ~~(Math.random() * 20),
        ~~(Math.random() * 20),
        ~~(Math.random() * 20)
      ]
      this.myChart.update()
    }
  }
};
</script>

<style lang="css">
</style>

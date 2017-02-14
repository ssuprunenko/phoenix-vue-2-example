<template>
  <div>
    <canvas id='myChart' width='700' height='300'></canvas>
    <button class="f6 f5-ns ma3 ba b--black-20 bg-blue white ph3 ph4-ns pv2 pv3-ns br2 grow pointer" v-on:click='redrawChart'>Redraw!</button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      myChart: null,
      chartData: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          data: this.values,
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
    }
  },

  props: {
    values: {
      type: Array,
      default () {
        return []
      }
    }
  },

  mounted () {
    this.drawChart()
  },

  methods: {
    drawChart () {
      const ctx = document.getElementById('myChart').getContext('2d')
      this.myChart = new Chart(ctx, {
        type: 'bar',
        data: this.chartData,
        options: {
          responsive: true,
          legend: {
            display: false
          },
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true,
                min: 0,
                max: 100,
                fontSize: 16
              }
            }],
            xAxes: [{
              ticks: {
                fontSize: 16
              }
            }]
          }
        }
      })
    },
    redrawChart () {
      this.$http.get('random').then((response) => {
        return response.json()
      }).then((data) => {
        this.chartData.datasets[0].data = data
        this.myChart.update()
      })
    }
  }
}
</script>

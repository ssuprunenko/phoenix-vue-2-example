<template>
  <div>
    <button v-on:click='redrawChart'>Redraw!</button>
    <canvas id='myChart' width='700' height='300'></canvas>
  </div>
</template>

<script>
import Chart from 'chart.js'

export default {
  data () {
    return {
      myChart: null,
      chartData: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
          label: this.label,
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
    label: {
      type: String,
      default: 'Unknown'
    },
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
      const ctx = document.getElementById('myChart')
      this.myChart = new Chart(ctx, {
        type: 'bar',
        data: this.chartData,
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      })
    },
    redrawChart () {
      this.$http.get('random').then((response) => {
        console.log(response.data)
        this.chartData.datasets[0].data = JSON.parse(response.data)
        this.myChart.update()
      })
    }
  }
}
</script>

<style lang='css'>
</style>

<template>
  <div class="map" :style="`height: ${height}px`">
    <svg
      ref="svg"
      class="map-container"
      xmlns="http://www.w3.org/2000/svg"
      :width="width"
      :height="height"
      shape-rendering="geometricPrecision"
      :viewBox="`500 100 200 400`"
    ></svg>
  </div>
</template>

<script>
import * as Datamap from 'datamaps';
import * as d3 from 'd3';

export default {
  name: 'Map',
  props: {
    word: String,
  },
  data: function () {
    return {
      width: 0,
      height: 0,
    };
  },
  mounted() {
    window.addEventListener('resize', this.onResize);
    this.onResize();
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.onResize);
  },
  methods: {
    getProjection(region) {
      if (region === 'russia') {
        return () => {
          const projection = d3.geoOrthographic().center([-33, 33]).rotate([-80, -15]).scale(300);
          const path = d3.geoPath().projection(projection);
          return { path, projection };
        };
      }
    },
    onResize() {
      this.width = parent.innerWidth;
      this.height = parent.innerHeight;
      this.drawMap();
      // todo redraw component?
    },
    drawMap() {
      const container = this.$refs.svg;
      container.innerHTML = '';
      const projects = this.projects;
      const projCurId = this.projCurId;
      const region = 'russia';
      const datamap = new Datamap({
        // projection: 'mercator',
        height: 1000,
        width: 1000,
        element: container,
        setProjection: this.getProjection(region),
        geographyConfig: {
          hideAntarctica: false,
          popupTemplate: (geo) => `<div class="hoverinfo">${geo.properties.name}</div>`,
          popupOnHover: true, // True to show the popup while hovering
          highlightOnHover: false,
        },
        //          responsive     : true,
        fills: {
          LOW: '#b7cbe4',
          MEDIUM: '#ff7f0e',
          HIGH: '#d62728',
          defaultFill: '#e6e4db',
        },
      });
      const choroPleth = projects.reduce(
        (a, { country }) => ({
          ...a,
          [country]: {
            fillKey: 'LOW', // todo different colors
          },
        }),
        {}
      );
      datamap.updateChoropleth(choroPleth);
      const bubbles = projects.map(({ label, coordinates: [latitude, longitude], _id }) => ({
        label,
        latitude,
        longitude,
        radius: projCurId && projCurId === _id ? 10 : 5,
        fillKey: 'HIGH', // todo color depending on state,
        _id,
      }));
      datamap.bubbles(bubbles, {
        popupTemplate: function (geo, data) {
          return `<div class="hoverinfo">${data.label}</div>`;
        },
      });
    },
  },
};
</script>

<style scoped>
.map {
  display: inline-flex;
  flex-wrap: nowrap;
  flex-direction: row;
  justify-content: center;
  justify-items: center;
  align-content: center;
  align-items: center;
  overflow: none;
  transform: translateY(0px);
}
.map-container {
  position: absolute;
  left: 0;
  top: 0;
}
</style>

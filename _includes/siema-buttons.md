<div class="siema-buttons">
  <button class="prev button button--light">←</button>
  <button class="next button button--light">→</button>
</div>
<script src="/js/siema.min.js" type="text/javascript"> </script>
<script type="text/javascript">
  const mySiema = new Siema({
    loop: true,
  });
  document.querySelector('.prev').addEventListener('click', () => mySiema.prev());
  document.querySelector('.next').addEventListener('click', () => mySiema.next());
</script>

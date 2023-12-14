enum HorarioStatusType {
  cabelo(name: 'Cabelo'),
  barba(name: 'Barba'),
  cabeloBarba(name: 'Cabelo e Barba'),
  pigmentacao(name: 'Pigmentação'),
  luzes(name: 'Luzes'),
  cabeloSombrancelha(name: 'Cabelo e Sombrancelha');

  final String name;

  const HorarioStatusType({required this.name});
}

class AffirmationSelectFi {
	final List<String> _selected = [];

	bool add(String affirmation) {
		if (_selected.length >= 3 || _selected.contains(affirmation)) {
			return false;
		}
		_selected.add(affirmation);
		return true;
	}

	void remove(String affirmation) {
		_selected.remove(affirmation);
	}

	bool get isComplete => _selected.length == 3;

	List <String> get selected => List.unmodifiable(_selected);

	void reset() {
		_selected.clear();
	}
}

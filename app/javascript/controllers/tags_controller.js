import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags"
export default class extends Controller {
  static values = {
    userTags: Array,
    allTags: Array
  }

  static targets = ['tags', 'category', 'input', 'suggestions', 'hiddenField']

  initialize(){
    this.userTags = this.userTagsValue;
    this.focusIndex = -1;
  }

  hiddenFieldTargetConnected(hiddenField) {
    this.setHiddenFieldValue();
  }

  setHiddenFieldValue() {
    if(this.hasCategoryTarget) {
      this.hiddenFieldTarget.value = JSON.stringify(this.userTags);
    } else {
      this.hiddenFieldTarget.value = this.userTags;
    }
  }

  connect() {
  }

  handleKeyDown(e) {
    if(e.key == "Enter") {
      e.preventDefault();
    } else if(e.key == "Backspace" && this.inputTarget.selectionStart == 0 && this.userTags.length > 0) {
      this.autocomplete();
      this.removeLastTagFromHTML();
    } else {
      this.deselectLastTag();
    }
  }

  handleKeyUp(e) {
    if(e.key == "," || e.key == "Enter") {
      this.addTagToHTML();
    } else if(e.key == "ArrowDown") {
      this.focusIndex++;
      this.setActiveSuggestion();
    } else if(e.key == "ArrowUp") {
      this.focusIndex--;
      this.setActiveSuggestion();
    }
    else {
      this.autocomplete();
    }
  }

  addTagToHTML() {
    let tag = this.getNewTagValue();
    if(tag) {
      tag = this.formatTag(tag);
      if(this.hasCategoryTarget) {
        this.addInstrumentTag(tag);
      } else {
        this.addGenreTag(tag);
      }
    }
    this.inputTarget.value = "";
    this.autocomplete();
  }

  getNewTagValue() {
    if(this.focusIndex > -1) {
      return this.suggestionsTarget
        .children[this.focusIndex]
        .innerText
    } else {
      return this.inputTarget.value.split(",")[0]
    }
  }

  formatTag(tag) {
    if(tag == "") return null
    else return tag
      .toLowerCase()
      .replaceAll(/ /g, '-')
      .replaceAll(/[^a-zA-Z0-9&-]/g, '');
  }

  addInstrumentTag(tag) {
    this.setCategory(tag);
    if(this.categoryTarget.value) {
      if(!(this.userTags.some((e) => JSON.stringify(e) == JSON.stringify([tag, this.categoryTarget.value])))) {
        this.userTags.push([tag, this.categoryTarget.value]);
        this.setHiddenFieldValue();
        this.tagsTarget.insertAdjacentHTML(
          "beforeend", `
            <p class="profile-tags">#${tag}</p>
          `);
      }
    } else {
      this.checkCategoryValidity();
    }
  }

  setCategory(tag) {
    if(!this.categoryTarget.value) {
      const tagCategory = this.allTagsValue.find((e) => e[0] == tag)?.[1]
      if(tagCategory) {
        this.categoryTarget.value = tagCategory;
      } else {
        this.categoryTarget.selectedIndex = 0;
      }
      this.categoryTarget.dispatchEvent(new Event('input', { 'bubbles': true }));
    }
  }

  checkCategoryValidity() {
    if(!this.categoryTarget.value) {
      this.categoryTarget.classList.add("is-invalid");
    } else {
      this.categoryTarget.classList.remove("is-invalid");
    }
  }

  addGenreTag(tag) {
    if(!(this.userTags.includes(tag))) {
      this.userTags.push(tag);
      this.setHiddenFieldValue();
      this.tagsTarget.insertAdjacentHTML(
        "beforeend", `
          <p class="profile-tags">#${tag}</p>
        `);
    }
  }

  removeLastTagFromHTML() {
    if(this.tagsTarget.lastElementChild.classList.contains("selected-tag")) {
      this.userTags.pop();
      this.setHiddenFieldValue();
      this.tagsTarget.lastElementChild.remove();
    } else {
      this.tagsTarget.lastElementChild.classList.add("selected-tag");
    }
  }

  deselectLastTag() {
    if(
      this.tagsTarget.lastElementChild &&
      this.tagsTarget.lastElementChild.classList.contains("selected-tag")
    ) {
      this.tagsTarget.lastElementChild.classList.remove("selected-tag");
    }
  }

  autocomplete() {
    const input = this.formatTag(this.inputTarget.value);
    let data;
    if (Array.isArray(this.allTagsValue[0])) {
      data = this.filterByCategory();
    } else {
      data = this.allTagsValue;
    }
    const matches = data.filter((tag) => tag.includes(input));
    const sorted = this.bestMatchesFirst(matches, input);
    this.focusIndex = -1;
    this.displaySuggestions(sorted);
  }

  filterByCategory() {
    let categories;
    if(this.categoryTarget.value) {
      categories = this.allTagsValue.filter((a) => {
        return a[1] == this.categoryTarget.value
      })
    } else {
      categories = this.allTagsValue
    }
    return categories.map(a => a[0]).flat();
  }

  bestMatchesFirst(array, query) {
    return array.map((item) => ({
      result: item,
      score: this.rateMatch(item, query)
    })).sort((a,b) => {
        if(a.score == b.score) return 0
        else return ((a.score > b.score) ? -1 : 1)
      }).map((item) => item.result)
  }

  rateMatch(item, query) {
    if(item.match(new RegExp("^" + query + "$"))) return 2
    else if(item.match(new RegExp("^" + query))) return 1
    else return 0;
  }

  displaySuggestions(suggestions) {
    this.suggestionsTarget.innerHTML = '';
    suggestions.forEach(s => {
      this.suggestionsTarget.insertAdjacentHTML("beforeend", `
        <li class="list-group-item list-group-item-action" data-action="click->tags#clickToAdd">
          ${s}
        </li>
      `
      )
    });
  }

  setActiveSuggestion() {
    const suggestionElements = this.suggestionsTarget.children;
    if(!suggestionElements) return;
    this.removeActiveSuggestion();
    if(this.focusIndex >= suggestionElements.length) {
      this.focusIndex = 0;
    } else if(this.focusIndex < 0) {
      this.focusIndex = suggestionElements.length - 1;
    }
    suggestionElements[this.focusIndex].classList.add("active");
  }

  removeActiveSuggestion() {
    const suggestionElements = this.suggestionsTarget.children;
    for(let element of suggestionElements) {
      element.classList.remove("active");
    }
  }

  clickToAdd(e) {
    this.focusIndex = -1;
    this.inputTarget.value = e.target.innerText;
    this.addTagToHTML();
  }
}
